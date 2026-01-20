import sys, os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "../../")))
import pytest
from unittest.mock import MagicMock, patch, ANY
from app.models.caso import Caso
# ===================== FIXTURE =====================
@pytest.fixture
def mock_cursor_commit():
    cursor_mock = MagicMock()
    conn_mock = MagicMock()
    conn_mock.cursor.return_value = cursor_mock
    conn_mock.is_connected.return_value = True
    return conn_mock, cursor_mock

# ===================== TESTS =====================
def test_insert_case(mock_cursor_commit):
    conn_mock, cursor_mock = mock_cursor_commit
    cursor_mock.lastrowid = 1

    with patch("app.models.caso.Conexion.get_connection", return_value=conn_mock):
        id_caso = Caso.insert_case(
            fecha="2025-10-29",
            descripcion="Caso test",
            direccion="Calle 1",
            personas_afectadas=3,
            fk_usuario=1,
            fk_desastre=1,
            fk_ciudad=1,
            radicado="RAD123"
        )
    assert id_caso == 1
    cursor_mock.execute.assert_called()  # Se llamó al execute
    conn_mock.commit.assert_called()     # Se llamó al commit

def test_get_case_by_id():
    row_data = (1, "2025-10-29", "Desc", "Dir", 2, 1, "Desastre", "Municipio", "Case", "01", "Alta")
    mock_db = MagicMock()
    mock_db.execute_query.return_value = row_data

    with patch("app.models.caso.Conexion", return_value=mock_db):
        caso = Caso.get_case_by_id(1)
    assert caso["id"] == 1
    assert caso["descripcion"] == "Desc"

def test_get_cases_user():
    rows = [
        (1, "2025-10-29", "Caso1", "Dir", 2, "Desastre", "Municipio", "Case", "01"),
        (2, "2025-10-30", "Caso2", "Dir2", 3, "Desastre2", "Municipio2", "Case2", "02")
    ]
    mock_db = MagicMock()
    mock_db.execute_query.return_value = rows

    with patch("app.models.caso.Conexion", return_value=mock_db):
        casos = Caso.get_cases_user(1)
    assert len(casos) == 2
    assert casos[0]["descripcion"] == "Caso1"

def test_get_cases_admin():
    rows = [
        (1, "2025-10-29", "Caso Admin", "Dir", 2, "Desastre", "Municipio", "Case", "01", 1, "User", "Juan Perez")
    ]
    mock_db = MagicMock()
    mock_db.execute_query.return_value = rows

    with patch("app.models.caso.Conexion", return_value=mock_db):
        casos = Caso.get_cases_admin()
    assert len(casos) == 1
    assert casos[0]["descripcion"] == "Caso Admin"

def test_generate_report():
    rows = [

        (1, "2025-10-29", "Reporte", "Dir", 2, "Desastre", "Municipio", "Case", "01", "Entidad", 1, "User", "Juan Perez")
    ]
    mock_db = MagicMock()
    mock_db.execute_query.return_value = rows

    with patch("app.models.caso.Conexion", return_value=mock_db):
        casos = Caso.generate_report("2025-10-28", "2025-10-30")
    assert len(casos) == 1
    assert casos[0]["descripcion"] == "Reporte"

def test_get_user_by_case():
    row = (1, "Juan Perez", "juan@example.com", "1234567890")
    mock_db = MagicMock()
    mock_db.execute_query.return_value = row

    with patch("app.models.caso.Conexion", return_value=mock_db):
        user = Caso.get_user_by_case(1)

    assert user["id_persona"] == 1
    assert user["nombre_completo"] == "Juan Perez"
    assert user["email"] == "juan@example.com"
    assert user["num_contacto"] == "1234567890"
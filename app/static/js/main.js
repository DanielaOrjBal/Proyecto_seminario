document.addEventListener("DOMContentLoaded", function () {
  const NAVBAR_OFFSET = 120;
  const links = document.querySelectorAll(".second-navbar a[href^='#']");
  let animacionScroll = null;

  // Función de scroll suave hacia un elemento con duración controlada (en ms)
  function scrollToElement(element, duration = 1000, offset = NAVBAR_OFFSET) {
    // Cancelar animación previa si existe
    if (animacionScroll) {
      cancelAnimationFrame(animacionScroll);
      animacionScroll = null;
    }

    if (!element) return;

    const startY = window.scrollY;
    const targetY = element.getBoundingClientRect().top + window.scrollY - offset;
    const distance = targetY - startY;
    const startTime = performance.now();

    if (Math.abs(distance) < 1) return;

    function step(currentTime) {
      const elapsed = currentTime - startTime;
      const progress = Math.min(elapsed / duration, 1); // 0 a 1

      // Easing easeOutCubic (aceleración suave al final)
      const easeOutCubic = 1 - Math.pow(1 - progress, 3);
      const newY = startY + distance * easeOutCubic;

      window.scrollTo(0, newY);

      if (progress < 1) {
        animacionScroll = requestAnimationFrame(step);
      } else {
        animacionScroll = null;
        window.scrollTo(0, targetY);
      }
    }

    animacionScroll = requestAnimationFrame(step);
  }

  links.forEach(link => {
    link.addEventListener("click", function (e) {
      const id = this.getAttribute("href").substring(1);
      const target = document.getElementById(id);
      if (!target) return;

      e.preventDefault();
      scrollToElement(target, 3000); // 3 segundos

      history.replaceState(null, null, "#" + id);
    });
  });

  if (window.location.hash) {
    const id = window.location.hash.substring(1);
    const target = document.getElementById(id);
    if (target) {
      setTimeout(() => {
        scrollToElement(target, 3000);
      }, 200);
    }
  }
});

window.addEventListener("load", function () {
  document.documentElement.classList.add("loaded");
});
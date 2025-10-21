// Seleziona tutti i link della navbar
const navLinks = document.querySelectorAll("#nav-navigation a");

// Crea un observer per osservare le sezioni
const observer = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    // Se la sezione è visibile almeno al 50%
    if (entry.isIntersecting) {
      // Rimuove active da tutti
      navLinks.forEach(link => link.classList.remove("active"));
      // Trova il link che punta a questa sezione
      const activeLink = document.querySelector(`#nav-navigation a[href="#${entry.target.id}"]`);
      if (activeLink) activeLink.classList.add("active");
    }
  });
}, {
  threshold: 0.5 // % di visibilità per attivare la sezione
});

// Osserva tutte le sezioni della pagina
document.querySelectorAll("section").forEach(section => observer.observe(section));
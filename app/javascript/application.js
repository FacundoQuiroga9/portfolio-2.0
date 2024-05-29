// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// Función que envuelve toda la lógica de adjuntar eventos
function attachEventListeners() {
  const profileButton = document.querySelector('.user-icon');
  const reactButton = document.querySelector('.react-logo');
  const railsButton = document.querySelector('.rails-logo');
  const profileInfo = document.getElementById('profile-info');

  // Eventos de los botones de perfil, React y Rails
  if (profileButton) {
    profileButton.addEventListener('click', () => {
      fetch('/profile_info')
        .then(response => response.text())
        .then(html => {
          profileInfo.innerHTML = html;
        });
    });
  }

  if (reactButton) {
    reactButton.addEventListener('click', () => {
      fetch('/projects/react')
        .then(response => response.text())
        .then(html => {
          profileInfo.innerHTML = html;
          attachCardEventListeners();
        });
    });
  }

  if (railsButton) {
    railsButton.addEventListener('click', () => {
      fetch('/projects/rails')
        .then(response => response.text())
        .then(html => {
          profileInfo.innerHTML = html;
          attachCardEventListeners();
        });
    });
  }

  // Eventos de los botones de editar en las cards
  function attachCardEventListeners() {
    const editButtons = document.querySelectorAll('.edit-project-btn');
    editButtons.forEach(button => {
      button.addEventListener('click', (event) => {
        event.stopPropagation(); // Previene que el evento se propague a la card
      });
    });
  }

  attachCardEventListeners(); // Adjunta los eventos de las cards en la carga inicial

  // Eventos para cambiar el fondo
  document.querySelector('.react-logo').addEventListener('click', function() {
    document.body.classList.remove('rails-bg');
    document.body.classList.add('react-bg');
  });

  document.querySelector('.rails-logo').addEventListener('click', function() {
    document.body.classList.remove('react-bg');
    document.body.classList.add('rails-bg');
  });

  document.querySelector('.user-icon').addEventListener('click', function() {
    document.body.classList.remove('react-bg');
    document.body.classList.remove('rails-bg');
  });
}

// Llama a la función en la carga inicial de la página
document.addEventListener('DOMContentLoaded', attachEventListeners);

// Re-adjunta los eventos después de una navegación con Turbo
document.addEventListener('turbo:load', attachEventListeners);

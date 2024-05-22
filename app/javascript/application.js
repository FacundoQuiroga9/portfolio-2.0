// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


document.addEventListener('DOMContentLoaded', () => {
  const profileButton = document.querySelector('.user-icon');
  const reactButton = document.querySelector('.react-logo');
  const railsButton = document.querySelector('.rails-logo');
  const profileInfo = document.getElementById('profile-info');

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

  function attachCardEventListeners() {
    const projectCards = document.querySelectorAll('.project-card');
    projectCards.forEach(card => {
      card.addEventListener('click', () => {
        const projectId = card.getAttribute('data-project-id');
        window.location.href = `/projects/${projectId}`;
      });
    });
  }

  attachCardEventListeners(); // Attach event listeners on initial load if there are project cards
});


document.addEventListener("DOMContentLoaded", function() {
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
});

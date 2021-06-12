const initFixedNavbar = () => {
  const navbar = document.getElementById('navbar');
  if (window.location.root_path) {
    navbar.classList.add("fixed-top");
  }
}

const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-lewagon');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add('navbar-lewagon-white');
      } else {
        navbar.classList.remove('navbar-lewagon-white');
      }
    });
  }
}

export { initUpdateNavbarOnScroll, initFixedNavbar };

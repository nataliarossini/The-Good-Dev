const initOpenStatus = () => {
  const status = document.querySelector('#show-details');
    status.addEventListener('click', (event) => {
      event.currentTarget.insertAdjacentHTML("afterend", '<p>"#{application.project.motivation_letter}"</p>');
    });
}
export { initOpenStatus };
// not working

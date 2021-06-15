// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------
import { initUpdateNavbarOnScroll } from '../components/navbar';
import { initFixedNavbar } from '../components/navbar';
import { initChatroomCable } from '../channels/chatroom_channel';
import { openPopupForSkills, openPopupForLanguagess } from '../pages/dashboard.js'
import { initMapbox } from '../plugins/init_mapbox';

document.addEventListener('turbolinks:load', () => {
  // Call your JS functions here
  initUpdateNavbarOnScroll();
  initFixedNavbar();
  initChatroomCable();
  if (document.querySelector('#add-skill')) {
    openPopupForSkills();
  }
  if (document.querySelector('#add-language')) {
    openPopupForLanguagess();
  }
  initMapbox();
  openPopup();
});

// External imports
import "bootstrap";


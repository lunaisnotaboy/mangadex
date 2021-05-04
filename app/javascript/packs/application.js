// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from '@rails/ujs';
import * as ActiveStorage from '@rails/activestorage';
import Turbolinks from 'turbolinks';
import 'channels';
import 'owl.carousel';
import 'lightbox2';

Rails.start();
ActiveStorage.start();
Turbolinks.start();

const images = require.context('../images/', true)
const imagePath = (name) => images(name, true)

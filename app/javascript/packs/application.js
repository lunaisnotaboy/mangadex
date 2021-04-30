// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from '@rails/ujs';
import * as ActiveStorage from '@rails/activestorage';
import 'channels';
import 'bootstrap-select';
import 'owl.carousel';
import 'owl.carousel/dist/assets/owl.carousel.css';
import 'lightbox2';
import 'lightbox2/src/css/lightbox2.css';

Rails.start();
ActiveStorage.start();

require.context('../images', true)

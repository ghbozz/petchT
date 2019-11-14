import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('.select2').select2({ width: '100%'}); // (~ document.querySelectorAll)
};

const initSelector = () => {
  $(document).ready(function() {
      $('.js-example-basic-multiple').select2();
  });
}

export { initSelect2, initSelector };

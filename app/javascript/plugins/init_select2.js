import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('.select2').select2({ width: '100%'}); // (~ document.querySelectorAll)
};

const initSelector = () => {
  if (document.querySelector('#admin-tags-field')) {

    $(document).ready(function() {
      $('.js-example-basic-multiple').select2({
        tags: true
      })
    })

  } else {

    $(document).ready(function() {
        $('.js-example-basic-multiple').select2();
    });

  }
}

export { initSelect2, initSelector };

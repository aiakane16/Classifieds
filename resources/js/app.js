// resources/assets/js/app.js

import Vue from 'vue';
import App from './components/App';
import ExampleComponent from './components/ExampleComponent';

Vue.component('example-component',ExampleComponent);

export default new Vue({
    render: h => h(App),
});

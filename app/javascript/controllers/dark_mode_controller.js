import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="dark-mode"
export default class extends Controller {
  static targets = ['toggle'];

  connect() {
    this.onPageLoad();
  }
  
  onPageLoad() {
    if (localStorage.theme === 'dark' || (!('theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
      document.documentElement.classList.add('dark')
    } else {
      document.documentElement.classList.remove('dark')
    }
  }

  toggleDarkMode() {
    if (document.documentElement.classList.contains('dark')) {
      localStorage.theme = 'light';
      document.documentElement.classList.remove('dark');
    } else {
      localStorage.theme = 'dark';
      document.documentElement.classList.add('dark');
    }
  }
}

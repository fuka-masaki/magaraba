window.addEventListener("turbolinks:load", function(){
    class ArticleMenu{
        constructor() {
        this.DOM = {};
        this.DOM.btn = document.querySelector(".user_menu");
        this.DOM.x_btn = document.querySelector(".user_menu_cancel")
        this.DOM.cover = document.querySelector(".article_menu_cover");
        this.DOM.container = document.querySelector("#all");
        this._addEvent();
        }
        _toggle() {
        this.DOM.container.classList.toggle("article_menu-open");
        }
        
        _addEvent() {
        this.DOM.btn.addEventListener('click', this._toggle.bind(this));
        this.DOM.x_btn.addEventListener('click', this._toggle.bind(this));
        this.DOM.cover.addEventListener('click', this._toggle.bind(this));
        }
    }

    new ArticleMenu();
})
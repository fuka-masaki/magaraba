window.addEventListener("turbolinks:load", function(){
    class CommentsSort{
        constructor() {
        this.DOM = {};
        this.DOM.btn = document.querySelector(".comments_sort_icon");
        this.DOM.cover = document.querySelector(".comments_sort_cover");
        this.DOM.container = document.querySelector("#all");
        this._addEvent();
        }
        _toggle() {
        this.DOM.container.classList.toggle("comments_sort_open");
        }
        
        _addEvent() {
        this.DOM.btn.addEventListener('click', this._toggle.bind(this));
        this.DOM.cover.addEventListener('click', this._toggle.bind(this));
        }
    }

    new CommentsSort();
})
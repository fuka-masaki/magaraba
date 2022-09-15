// 新規投稿のフォームにクラス付与
window.addEventListener("turbolinks:load", function(){
    class NewPostFormArea {
        constructor() {
            this.DOM = {};
            this.DOM.btn = document.querySelector(".login_new_post_form");
            this.DOM.btn_2 = document.querySelector(".my_post_nil_new_post_btn");
            this.DOM.x_btn = document.querySelector(".new_post_form_x_btn");
            this.DOM.cover = document.querySelector(".new_post_form_cover");
            this.DOM.container = document.querySelector("#all");
            this.eventType = this._getEventType();
            this._addEvent();
        }
    
        _getEventType() {
            const isTouchCapable =
            "ontouchstart" in window ||
            (window.DocumentTouch && document instanceof window.DocumentTouch) ||
            navigator.maxTouchPoints > 0 ||
            window.navigator.msMaxTouchPoints > 0;
    
            return isTouchCapable ? "touchstart" : "click";
        }
    
        _toggle() {
            this.DOM.container.classList.toggle("new_post_form_open");
        }
    
        _addEvent() {
            this.DOM.btn.addEventListener(this.eventType, this._toggle.bind(this));
            this.DOM.x_btn.addEventListener(this.eventType, this._toggle.bind(this));
            this.DOM.cover.addEventListener(this.eventType, this._toggle.bind(this));
            this.DOM.btn_2.addEventListener(this.eventType, this._toggle.bind(this));
        }
    };
    new NewPostFormArea();
});
// 新規投稿のフォームにクラス付与
window.addEventListener("turbolinks:load", function(){
    class NoLoginNewPostFormArea {
        constructor() {
            this.DOM = {};
            this.DOM.btn = document.querySelector(".no_login_new_post_form");
            this.DOM.x_btn = document.querySelector(".no_login_new_post_form_x_btn");
            this.DOM.cover = document.querySelector(".no_login_new_post_form_cover");
            this.DOM.container = document.querySelector("#all");
            this.eventType = this._getEventType();
            this._addEvent();
        }
    
        _getEventType() {
            const isTouchCapable =
            "ontouchstart" in window ||
            (window.DocumentTouch && document instanceof window.DocumentTouch) ||
            navigator.maxTouchPoints > 0 ||
            window.navigator.msMaxTouchPoints > 0;
    
            return isTouchCapable ? "touchstart" : "click";
        }
    
        _toggle() {
            this.DOM.container.classList.toggle("no_login_new_post_form_open");
        }
    
        _addEvent() {
            this.DOM.btn.addEventListener(this.eventType, this._toggle.bind(this));
            this.DOM.x_btn.addEventListener(this.eventType, this._toggle.bind(this));
            this.DOM.cover.addEventListener(this.eventType, this._toggle.bind(this));
        }
    };
    new NoLoginNewPostFormArea();
});
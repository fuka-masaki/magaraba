window.addEventListener("turbolinks:load", function(){
    class SSearchOpen {
        constructor() {
            this.DOM = {};
            this.DOM.btn = document.querySelector(".smartphone_search_btn_show");
            this.DOM.return_btn = document.querySelector(".smartphone_search_return");
            this.DOM.cover = document.querySelector(".smartphone_search_cover");
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
            this.DOM.container.classList.toggle("smartphone_search_open");
        }
    
        _addEvent() {
            this.DOM.btn.addEventListener(this.eventType, this._toggle.bind(this));
            this.DOM.return_btn.addEventListener(this.eventType, this._toggle.bind(this));
            this.DOM.cover.addEventListener(this.eventType, this._toggle.bind(this));
        }
    };
    new SSearchOpen();
});
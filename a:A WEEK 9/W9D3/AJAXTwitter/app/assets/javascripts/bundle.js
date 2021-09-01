/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/***/ ((module) => {

class FollowToggle{
  // this.userId = el.data-user-id;
  // this.followState = el.intital-follow-state;
  constructor(el){
    this.$el = $(el);
    this.userId = this.$el.attr("data-user-id");
    this.followState = this.$el.attr("data-initial-follow-state");
    this.render();
  }
  render(){
    if (this.followState === "followed"){
    this.$el.text( "Unfollow!");
    }else{
    this.$el.text( "Follow!");
    }
  }

  handleClick(event){
    event.preventDefault();
    if (this.followState === "followed"){
      $.ajax({
        url: `/users/${this.userId}/follow`,
        method: "delete"
      }).then(()=>{this.followState = "unfollowed"})
      .then(this.render);
    }else{
      $.ajax({
        url: `/users/${this.userId}/follow`,
        method: "post"
      }).then(()=>{this.followState = "followed"})
      .then(this.render);
    } 
  }
}

// FollowToggle.prototype.render = function(){
//   if (this.followState === "followed"){
//     this.$el.innerText( "Unfollow!");
//   }else{
//     this.$el.innerText( "Follow!");
//   }
// }

// FollowToggle.prototype.handleClick = function (event){
//   event.preventDefault();
//   if (this.followState === "followed"){
//     $.ajax({
//       url: `/users/${this.otherUser.id}/follow`,
//       method: "delete"
//     }).then(()=>{this.followState = "unfollowed"})
//     .then(this.render);
//   }else{
//     $.ajax({
//       url: `/users/${this.otherUser.id}/follow`,
//       method: "post"
//     }).then(()=>{this.followState = "followed"})
//     .then(this.render);
//   }
// }



module.exports = FollowToggle;

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
var __webpack_exports__ = {};
// This entry need to be wrapped in an IIFE because it need to be isolated against other modules in the chunk.
(() => {
/*!*****************************!*\
  !*** ./frontend/twitter.js ***!
  \*****************************/
const FollowToggle = __webpack_require__(/*! ./follow_toggle */ "./frontend/follow_toggle.js");

$(()=>{
  $("button.follow-toggle").each((idx, ele) => {
      new FollowToggle(ele);
  })
})
})();

/******/ })()
;
//# sourceMappingURL=bundle.js.map
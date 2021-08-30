/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\");\nconst Util = __webpack_require__(/*! ./utils */ \"./src/utils.js\");\n\nfunction Asteroid(options) {\n    options.color = options.color || \"#404E4D\";\n    options.radius = options.radius || 30;\n    options.vel = Util.randomVec(1);\n    // options.vel = [0,0];\n    MovingObject.call(this, options);\n}\n\nUtil.inherits(Asteroid, MovingObject);\n\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Asteroid = __webpack_require__(/*! ./asteroid */ \"./src/asteroid.js\");\n\nfunction Game(){\n  this.DIM_X = 1000;\n  this.DIM_Y = 1000;\n  this.NUM_ASTEROIDS = 10;\n  this.asteroids = [];\n  for(let i = 0; i < this.NUM_ASTEROIDS ; i++){\n    this.addAsteroids();\n  }\n}\n\nGame.prototype.addAsteroids = function(){\n  this.asteroids.push(new Asteroid({pos: this.randomPosition(),game: this}));\n}\n\nGame.prototype.randomPosition = function(){\n  let x = Math.random() * this.DIM_X;\n  let y = Math.random() * this.DIM_Y;\n  return [x,y];\n}\n\nGame.prototype.draw = function(ctx){\n  // console.log(\"hi\");\n  ctx.clearRect(0,0,this.DIM_X,this.DIM_Y);\n  ctx.fillStyle = \"#000000\"\n  this.asteroids.forEach((ele) => {\n    ele.draw(ctx);\n  });\n}\n\nGame.prototype.moveObjects = function(){\n  this.asteroids.forEach((ele) =>{\n    ele.move();\n  });\n\n}\n\nGame.prototype.wrap = function(pos){\n  let x = pos[0];\n  let y = pos[1];\n  if(x > 1000){\n    x = 1;\n  }\n  if(y > 1000){\n    y = 1;\n  }\n  if(x < 0){\n    x = 999;\n  }\n  if(y < 0){\n    y = 999;\n  }\n  return [x,y];\n}\n\n\nGame.prototype.checkCollisions = function(){\n// [0,1,2,3,4]\n// [4,5]\n  for(let i = 0; i < this.NUM_ASTEROIDS; i++){\n    for(let j = i+1; j < this.NUM_ASTEROIDS;j++){\n      if(this.asteroids[i].isCollidedWith(this.asteroids[j])){\n        alert(\"COLLISION\");\n      }\n    }\n  }\n}\n\nGame.prototype.step = function(){\n  this.moveObjects();\n  this.checkCollisions();\n}\n\n\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Game = __webpack_require__(/*! ./game */ \"./src/game.js\")\n\nfunction GameView(game,ctx){\n  this.game = game;\n  this.ctx = ctx;\n}\n\nGameView.prototype.start = function(){\n  // const game = this.game;\n  // const context = this.ctx;\n  setInterval(()=>{\n    // console.log(this)\n    this.game.step();\n    this.game.draw(this.ctx);\n    // console.log(\"running\");\n  },20);\n}\n\nmodule.exports = GameView;\n\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

eval("// console.log(\"Webpack is working!\")\n\n// const MovingObject = require(\"./moving_object\");\nconst Asteroid = __webpack_require__(/*! ./asteroid */ \"./src/asteroid.js\");\nconst GameView = __webpack_require__(/*! ./game_view */ \"./src/game_view.js\");\nconst Game = __webpack_require__(/*! ./game */ \"./src/game.js\");\n// const Util = require(\"./utils\");\n\n// window.MovingObject = MovingObject;\nwindow.Asteroid = Asteroid;\n\n\n\ndocument.addEventListener(\"DOMContentLoaded\",function(){\n  const canvasEl = document.getElementById(\"game-canvas\");\n  canvasEl.width = 1000;\n  canvasEl.height = 1000;\n  const ctx = canvasEl.getContext(\"2d\");\n  const game = new Game();\n  console.log(game);\n  // const ast = new Asteroid({\n  //   pos: [300, 400]\n  // });\n\n  // ast.draw(ctx);\n  const gameview = new GameView(game,ctx).start();\n  // console.log(gameview);\n  // gameview.start();\n})\n// console.log(util);\n// console.log(MovingObject);\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/***/ ((module) => {

eval("function MovingObject(options){\n  this.pos = options.pos;\n  this.vel = options.vel;\n  this.radius = options.radius;\n  this.color = options.color;\n  this.game = options.game;\n}\n\nMovingObject.prototype.draw = function(ctx){\n  ctx.beginPath();\n  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2*Math.PI, true);\n  ctx.fillStyle = this.color;\n  ctx.fill();\n}\n\n\nMovingObject.prototype.move = function(){\n  this.pos[0] = this.pos[0] + this.vel[0];\n  this.pos[1] = this.pos[1] + this.vel[1];\n\n  this.pos = this.game.wrap(this.pos);\n}\n\nMovingObject.prototype.isCollidedWith = function(otherObject){\n  let difference = [this.pos[0] - otherObject.pos[0],this.pos[1] - otherObject.pos[1]];\n\n  let hyp = Math.sqrt((difference[0]**2) + (difference[1] **2));\n  let radSum = this.radius + otherObject.radius;\n\n  if(radSum >= hyp){\n    return true;\n  }else{\n    return false;\n  }\n\n}\n\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/utils.js":
/*!**********************!*\
  !*** ./src/utils.js ***!
  \**********************/
/***/ ((module) => {

eval("// Function.prototype.inherits = function(ParentClass){\n//   function Surrogate(){};\n//   Surrogate.prototype = ParentClass.prototype;\n//   this.prototype = new Surrogate();\n//   this.prototype.constructor = this;\n// }\n\nconst Util = {\n  inherits(ChildClass,ParentClass) {\n    // function Surrogate(){};\n    // Surrogate.prototype = ParentClass.prototype;\n    // childClass.prototype = new Surrogate();\n    ChildClass.prototype = Object.create(ParentClass.prototype);\n    ChildClass.prototype.constructor = ChildClass;\n  },\n\n  randomVec(length) {\n    const deg = 2 * Math.PI * Math.random();\n    return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n  },\n\n  // Scale the length of a vector by the given amount.\n  scale(vec, m) {\n    return [vec[0] * m, vec[1] * m];\n  }\n}\n\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/utils.js?");

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
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = __webpack_require__("./src/index.js");
/******/ 	
/******/ })()
;
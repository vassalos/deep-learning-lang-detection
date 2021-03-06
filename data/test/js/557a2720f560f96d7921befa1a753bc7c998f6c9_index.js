module.exports = angular.module('eprezApp.controllers', [])
		.controller('rootController', require('./rootController'))
		.controller('recorderController', require('./recorderController'))
		.controller('playerController', require('./playerController'))
        .controller('documentCarouselController', require('./documentCarouselController'))
        .controller('chatController', require('./chatController'))
        .controller('listenersController', require('./listenersController'))
        .controller('loadingController', require('./loadingController'))

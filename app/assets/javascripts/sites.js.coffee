# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

HangManApp = angular.module "HangManApp", []


HangManApp.controller "HangManCtrl", ["$scope", ($scope) ->

  $scope.openModal = false
  $scope.letters = [
    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
  ]

  $scope.showModal = ->
    $scope.openModal = true

  $scope.hideModal = ->
    $scope.openModal = false

  # consider hints in an array
  # make it easier to use the index
  # with the show hint button(s)
  $scope.setSecret = (secret) ->
    $scope.secret = secret
    console.log "secret", $scope.secret
    $scope.openModal = false

  $scope.guessLetter = (letter) ->
    if $scope.secret.word.indexOf(letter) != -1
      $scope[letter] = true

  $scope.getHint = ->

]

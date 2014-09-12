# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

HangManApp = angular.module "HangManApp", []


HangManApp.controller "HangManCtrl", ["$scope", ($scope) ->

  $scope.openModal = false
  $scope.letters = [
    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
  ]
  $scope.showHint = []
  $scope.hintBtn = []
  # every wrong guess decrements bodyCount
  $scope.bodyCount = 6
  $scope.winCount = 0
  $scope.axe = [false, false, false, false, false, false]

  # scoring
  $scope.turnScore = 1000
  $scope.gameScore = 0

  $scope.showModal = ->
    $scope.openModal = true

  $scope.hideModal = ->
    $scope.openModal = false

  $scope.setSecret = (secret) ->
    $scope.secret = secret
    console.log "secret", $scope.secret
    $scope.openModal = false
    # run canvas logic here to setup body

  $scope.guessLetter = (letter) ->
    if $scope.secret.word.indexOf(letter) != -1
      $scope[letter] = true
      # check win
      $scope.winCount += 1
      if $scope.winCount >= $scope.secret.word.length
        $scope.celebrate()
    else
      $scope.turnScore -= 25
      $scope.axeBodypart($scope.bodyCount)
      $scope.bodyCount -= 1
      #check loss
      if $scope.bodyCount <= 0
        $scope.fail()

  $scope.getHint = (index) ->
    $scope.showHint[index] = true
    $scope.turnScore -= 100
    $scope.hintBtn[index] = true
    console.log($scope.turnScore)

  $scope.hideHint = (index) ->
    $scope.showHint[index] = false

  $scope.axeBodypart = (num) ->
    console.log("body part axed", num)
    #run canvas logic here to remove body part
    $scope.axe[num] = true

  $scope.resetGame = ->
    $scope.showHint = []
    $scope.bodyCount = 6
    $scope.winCount = 0
    $scope.turnScore = 1000
    $scope.axe = [false, false, false, false, false, false]
    $scope.secret = {}
    $scope.hintBtn = []

  $scope.celebrate = ->
    console.log("you win!")
    $scope.gameScore += $scope.turnScore
    $scope.showResult("You win!")
    $scope.resetGame()

  $scope.fail = ->
    console.log("you lose!")
    $scope.showResult("You lose!")
    $scope.resetGame()

  $scope.showResultModal = (message) ->
    $scope.result.message = message
    $scope.showResult = true



]














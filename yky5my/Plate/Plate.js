/* eslint-disable require-yield, eqeqeq */

import {
  Sprite,
  Trigger,
  Watcher,
  Costume,
  Color,
  Sound
} from "https://unpkg.com/leopard@^1/dist/index.esm.js";

export default class Plate extends Sprite {
  constructor(...args) {
    super(...args);

    this.costumes = [
      new Costume("01_dish", "./Plate/costumes/01_dish.png", {
        x: 270,
        y: -162
      })
    ];

    this.sounds = [];

    this.triggers = [
      new Trigger(Trigger.GREEN_FLAG, this.whenGreenFlagClicked)
    ];
  }

  *whenbackdropswitchesto() {
    this.x = 93;
    this.y = -2;
    this.visible = true;
    while (true) {
      if (
        (this.keyPressed("d") || this.keyPressed("right arrow")) &&
        !this.touching(this.sprites["Rightborder"].andClones())
      ) {
        this.x += 10;
      }
      if (
        (this.keyPressed("a") || this.keyPressed("left arrow")) &&
        !this.touching(this.sprites["Leftborder"].andClones())
      ) {
        this.x -= 10;
      }
      yield;
    }
  }

  *whenbackdropswitchesto2() {
    this.visible = false;
  }

  *whenGreenFlagClicked() {
    this.visible = false;
  }
}

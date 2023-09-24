/* eslint-disable require-yield, eqeqeq */

import {
  Sprite,
  Trigger,
  Watcher,
  Costume,
  Color,
  Sound
} from "https://unpkg.com/leopard@^1/dist/index.esm.js";

export default class Hotdog extends Sprite {
  constructor(...args) {
    super(...args);

    this.costumes = [
      new Costume("55_hotdog_sauce", "./Hotdog/costumes/55_hotdog_sauce.png", {
        x: 17,
        y: 20
      })
    ];

    this.sounds = [];

    this.triggers = [
      new Trigger(Trigger.GREEN_FLAG, this.whenGreenFlagClicked)
    ];
  }

  *whenbackdropswitchesto() {
    yield* this.food();
  }

  *food() {
    yield* this.wait(this.random(1, 10));
    this.goto(this.random(-240, 240), this.random(-180, 180));
    this.y = 188;
    this.visible = true;
    while (true) {
      this.y -= 5;
      if (this.touching(this.sprites["Plate"].andClones())) {
        this.visible = false;
        this.stage.vars.score++;
        this.broadcast("score++");
        this.stage.vars.iscollected = 1;
        if (this.toNumber(this.stage.vars.iscollected) === 1) {
          yield* this.food();
        }
      }
      if (this.touching(this.sprites["Bottomborder"].andClones())) {
        this.visible = false;
        this.broadcast("missedFood");
        this.stage.vars.iscollected = 1;
        if (this.toNumber(this.stage.vars.iscollected) === 1) {
          yield* this.food();
        }
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

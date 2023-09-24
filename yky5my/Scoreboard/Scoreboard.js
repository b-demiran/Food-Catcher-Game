/* eslint-disable require-yield, eqeqeq */

import {
  Sprite,
  Trigger,
  Watcher,
  Costume,
  Color,
  Sound
} from "https://unpkg.com/leopard@^1/dist/index.esm.js";

export default class Scoreboard extends Sprite {
  constructor(...args) {
    super(...args);

    this.costumes = [
      new Costume("scoreBoard", "./Scoreboard/costumes/scoreBoard.svg", {
        x: 55.86336336336356,
        y: 213.0885885885886
      })
    ];

    this.sounds = [];

    this.triggers = [
      new Trigger(Trigger.GREEN_FLAG, this.whenGreenFlagClicked)
    ];
  }

  *whenbackdropswitchesto() {
    this.visible = true;
  }

  *whenGreenFlagClicked() {
    this.visible = false;
  }
}

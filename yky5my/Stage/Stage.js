/* eslint-disable require-yield, eqeqeq */

import {
  Stage as StageBase,
  Trigger,
  Watcher,
  Costume,
  Color,
  Sound
} from "https://unpkg.com/leopard@^1/dist/index.esm.js";

export default class Stage extends StageBase {
  constructor(...args) {
    super(...args);

    this.costumes = [
      new Costume("start", "./Stage/costumes/start.png", { x: 480, y: 360 }),
      new Costume("play", "./Stage/costumes/play.png", { x: 480, y: 357 }),
      new Costume("gameOver", "./Stage/costumes/gameOver.svg", {
        x: 240,
        y: 180
      })
    ];

    this.sounds = [new Sound("pop", "./Stage/sounds/pop.wav")];

    this.triggers = [
      new Trigger(Trigger.GREEN_FLAG, this.whenGreenFlagClicked),
      new Trigger(
        Trigger.KEY_PRESSED,
        { key: "space" },
        this.whenKeySpacePressed
      )
    ];

    this.vars.iscollected = 1;
    this.vars.score = 35;
    this.vars.livescount = 5;
  }

  *whenGreenFlagClicked() {
    this.costume = "start";
  }

  *whenKeySpacePressed() {
    this.costume = "play";
  }
}

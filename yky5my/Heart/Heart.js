/* eslint-disable require-yield, eqeqeq */

import {
  Sprite,
  Trigger,
  Watcher,
  Costume,
  Color,
  Sound
} from "https://unpkg.com/leopard@^1/dist/index.esm.js";

export default class Heart extends Sprite {
  constructor(...args) {
    super(...args);

    this.costumes = [
      new Costume("Heart", "./Heart/costumes/Heart.png", { x: 64, y: 22 }),
      new Costume("Heart1", "./Heart/costumes/Heart1.png", { x: 100, y: 100 }),
      new Costume("Heart2", "./Heart/costumes/Heart2.png", { x: 64, y: 22 }),
      new Costume("Heart3", "./Heart/costumes/Heart3.png", { x: 64, y: 22 }),
      new Costume("Heart4", "./Heart/costumes/Heart4.png", { x: 64, y: 22 }),
      new Costume("Heart5", "./Heart/costumes/Heart5.svg", { x: 0, y: 0 })
    ];

    this.sounds = [];

    this.triggers = [
      new Trigger(
        Trigger.BROADCAST,
        { name: "missedFood" },
        this.whenIReceiveMissedfood
      ),
      new Trigger(Trigger.GREEN_FLAG, this.whenGreenFlagClicked)
    ];
  }

  *whenbackdropswitchesto() {
    this.visible = true;
  }

  *whenIReceiveMissedfood() {
    this.costumeNumber++;
    this.stage.vars.livescount++;
    if (this.toNumber(this.stage.vars.livescount) === 5) {
      this.stage.costume = "gameOver";
      /* TODO: Implement stop all */ null;
    }
  }

  *whenbackdropswitchesto2() {
    this.visible = false;
  }

  *whenGreenFlagClicked() {
    this.visible = false;
    this.costume = "Heart";
    this.stage.vars.livescount = 0;
  }
}

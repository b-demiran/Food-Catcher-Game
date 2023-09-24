import { Project } from "https://unpkg.com/leopard@^1/dist/index.esm.js";

import Stage from "./Stage/Stage.js";
import Startbutton from "./Startbutton/Startbutton.js";
import Plate from "./Plate/Plate.js";
import Bottomborder from "./Bottomborder/Bottomborder.js";
import Leftborder from "./Leftborder/Leftborder.js";
import Rightborder from "./Rightborder/Rightborder.js";
import Scoreboard from "./Scoreboard/Scoreboard.js";
import Scoreones from "./Scoreones/Scoreones.js";
import Scoretens from "./Scoretens/Scoretens.js";
import Scorehundreds from "./Scorehundreds/Scorehundreds.js";
import Heart from "./Heart/Heart.js";
import Burger from "./Burger/Burger.js";
import Hotdog from "./Hotdog/Hotdog.js";
import Pizza from "./Pizza/Pizza.js";
import Icons from "./Icons/Icons.js";
import Taco from "./Taco/Taco.js";

const stage = new Stage({ costumeNumber: 3 });

const sprites = {
  Startbutton: new Startbutton({
    x: 38,
    y: 30,
    direction: 90,
    costumeNumber: 1,
    size: 100,
    visible: false,
    layerOrder: 1
  }),
  Plate: new Plate({
    x: 263,
    y: -2,
    direction: 90,
    costumeNumber: 1,
    size: 100,
    visible: false,
    layerOrder: 13
  }),
  Bottomborder: new Bottomborder({
    x: 79,
    y: 0,
    direction: 90,
    costumeNumber: 1,
    size: 100,
    visible: true,
    layerOrder: 2
  }),
  Leftborder: new Leftborder({
    x: -50,
    y: -33,
    direction: 90,
    costumeNumber: 1,
    size: 100,
    visible: true,
    layerOrder: 3
  }),
  Rightborder: new Rightborder({
    x: 12,
    y: 4,
    direction: 90,
    costumeNumber: 1,
    size: 100,
    visible: true,
    layerOrder: 4
  }),
  Scoreboard: new Scoreboard({
    x: -150,
    y: -35,
    direction: 90,
    costumeNumber: 1,
    size: 100,
    visible: true,
    layerOrder: 9
  }),
  Scoreones: new Scoreones({
    x: 49,
    y: 26,
    direction: 90,
    costumeNumber: 6,
    size: 100,
    visible: true,
    layerOrder: 10
  }),
  Scoretens: new Scoretens({
    x: 31,
    y: 26,
    direction: 90,
    costumeNumber: 4,
    size: 100,
    visible: true,
    layerOrder: 11
  }),
  Scorehundreds: new Scorehundreds({
    x: 13,
    y: 26,
    direction: 90,
    costumeNumber: 1,
    size: 100,
    visible: false,
    layerOrder: 12
  }),
  Heart: new Heart({
    x: -167,
    y: 110,
    direction: 90,
    costumeNumber: 6,
    size: 100,
    visible: false,
    layerOrder: 14
  }),
  Burger: new Burger({
    x: 59,
    y: 133,
    direction: 90,
    costumeNumber: 1,
    size: 100,
    visible: false,
    layerOrder: 8
  }),
  Hotdog: new Hotdog({
    x: 74,
    y: 143,
    direction: 90,
    costumeNumber: 1,
    size: 100,
    visible: false,
    layerOrder: 5
  }),
  Pizza: new Pizza({
    x: 177,
    y: -62,
    direction: 90,
    costumeNumber: 1,
    size: 100,
    visible: false,
    layerOrder: 6
  }),
  Icons: new Icons({
    x: -75,
    y: 0,
    direction: 90,
    costumeNumber: 1,
    size: 100,
    visible: true,
    layerOrder: 15
  }),
  Taco: new Taco({
    x: -27,
    y: -164,
    direction: 90,
    costumeNumber: 1,
    size: 100,
    visible: false,
    layerOrder: 7
  })
};

const project = new Project(stage, sprites, {
  frameRate: 30 // Set to 60 to make your project run faster
});
export default project;

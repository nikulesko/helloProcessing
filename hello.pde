int RIGHT_PANEL_WIDTH = 200;

int iteration = 0;
boolean paused = true;

public class World {
  int xpos, ypos;
  color fieldColor;

  //gene

  public color getColor() {
    return fieldColor;
  }

  public void update() {

  }
}

public class Flora extends World {

  public Flora (int x, int y) {
    xpos = x;
    ypos = y;
    fieldColor = color(0, 128, 0);
  }

  public void update() {

  }
}

public class Fauna extends World {

  public Fauna (int x, int y) {
    xpos = x;
    ypos = y;
    fieldColor = color(255, 0, 0);
  }

  public void update() {

  }
}

World[][] WORLD;

void setup() {
  size(1300, 700);
  noLoop();

  WORLD = new World[width-RIGHT_PANEL_WIDTH][height];

  //generate world
  for (int i = 0; i < width-RIGHT_PANEL_WIDTH; i++) {
    for (int j = 0; j < height; j++) {
      int rand = int(random(2));
      if(rand == 1) {
        WORLD[i][j] = new Flora(i, j);
      } else {
        WORLD[i][j] = new Fauna(i, j);
      }
    }
  }
}

void draw() {
  //right panel
  for (int i = width-RIGHT_PANEL_WIDTH; i < width; i++) {
    for (int j = 0; j < height; j++) {
      color c = color(0, 0, 0);
      set(i, j, c);
    }
  }

  for (int i = 0; i < width-RIGHT_PANEL_WIDTH; i++) {
    for (int j = 0; j < height; j++) {
      WORLD[i][j].update();
      set(i, j, WORLD[i][j].getColor());
    }
  }

  iteration++;
  textSize(20);
  text("Iteration = " + iteration, width-200+10, 40);
  fill(0, 408, 612);
}

void keyPressed() {
  if (keyPressed) {
    if (key == 'p') {
      if (paused) {
        paused = false;
        loop();
      } else {
        text("-=PAUSED=-", width-200+40, 20);
        noLoop();
        paused = true;
      }
    } else if (key == 's') {
      paused = false;
      loop();
      text("-=RUNNING=-", width-200+40, 20);
    }
  }
}
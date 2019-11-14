void startBoats() {
  fill(255);

  if (int(random(150)) == 5) { //1% chance to start drawing the next boat each loop
    boatX1.append(1000);
  } else if (int(random(150)) == 6) {
    boatX2.append(0);
  }  

  for (int i = 0; i<boatX1.size(); i++) { //draw boat 
    rect(boatX1.get(i), 200, 3*gridSize, gridSize);
    boatX1.sub(i, obsSpeed);
    if (boatX1.get(i) < 0) { //stop drawing boat once it goes beyond screen
      boatX1.remove(i);
    }
  }

  for (int i = 0; i<boatX2.size(); i++) { //draw boat
    rect(boatX2.get(i), 100, 3*gridSize, gridSize);
    boatX2.add(i, obsSpeed);
    if (boatX2.get(i) > 1000) { //stop drawing boat once it goes beyond screen
      boatX2.remove(i);
    }
  }
}

void startCar() { //function to draw cars
  fill(255, 255, 0);

  if (int(random(100)) == 5) { //1% chance to start drawing the next car each loop
    carX1.append(1000);
  } else if (int(random(100)) == 6) {
    carX2.append(0);
  }  

  for (int i = 0; i<carX1.size(); i++) { //draw moving car
    image(car, carX1.get(i), 500);
    carX1.sub(i, obsSpeed + 2);
    if (carX1.get(i) < 0) { //stop drawing car once it goes beyond screen
      carX1.remove(i);
    }
  }

  for (int i = 0; i<carX2.size(); i++) { //draw moving car
    image(car,carX2.get(i), 400);
    carX2.add(i, obsSpeed + 2);
    if (carX2.get(i) > 1000) {
      carX2.remove(i);
    }
  }
}

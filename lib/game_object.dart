class GameObject {
String name;
int posX;
int posY;

GameObject({required this.name, required this.posX, required this.posY});

  void despawn() {
    print('$name despawned from the game.');
  }

}

abstract class DamageableObject extends GameObject {
  int maxHealth;
  int health;

DamageableObject ({
    required String name,
    required int posX,
    required int posY,
    required this.maxHealth,
  })  : health = maxHealth,
        super(name: name, posX: posX, posY: posY);

  bool get isDead => health <= 0;

  void takeDamage(int damage) {
    health -= damage;
    if (health < 0) health = 0;
    print('$name took $damage damage, health now $health/$maxHealth');
  }

  void onKilled();

}

class Player extends DamageableObject {
  int score;
  int livesRemaining;

  Player ({
    required String name,
    required int posX,
    required int posY,
    required int maxHealth,
    this.score = 0,
    this.livesRemaining = 3,
  }) : super(name: name, posX: posX, posY: posY, maxHealth: maxHealth);

  @override
  void onKilled() {
    livesRemaining--;
    print('$name was killed! Lives remaining: $livesRemaining');
  }
}

class Monster extends DamageableObject {
  int threatLevel;
  String color;

  Monster ({
    required String name,
    required int posX,
    required int posY, 
    required int maxHealth,
    required this.threatLevel,
    required this.color,
    }) : super(name: name, posX: posX, posY: posY, maxHealth: maxHealth);

  @override
  void onKilled() {
    print('$name the monster was killed!');
  }

  void makeNoise() {
    print('$name the $color monster growls!');
  }   
}



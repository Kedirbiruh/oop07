import '../lib/game_object.dart';
void main() {
  var hero = Player(name: 'Hero', posX: 10, posY: 20, maxHealth: 100);
  var goblin = Monster(
      name: 'Goblin', posX: 5, posY: 5, maxHealth: 50, threatLevel: 2, color: 'Green');

  hero.takeDamage(30);
  goblin.takeDamage(60);

  hero.onKilled();
  goblin.onKilled();

  hero.despawn();
}
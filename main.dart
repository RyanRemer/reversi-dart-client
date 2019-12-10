import 'ai/random.dart';
import 'ai/reversi_ai.dart';
import 'network/reversi_client.dart';

void main(List<String> args) {
  if (args.length < 3) {
    print("Commage Usage: command host playerColor(1|2) aiType(random, alphabeta, adjust)");
    return;
  }

  String host = args[0];
  int playerColor = int.parse(args[1]); // Black is 1, White is 2
  String aiType = args[2];
  ReversiAi ai;

  if (aiType == "random") {
    ai = RandomAi();
  } else {
    throw (aiType + "is not a supported aiType");
  }

  ReversiClient reversiClient = new ReversiClient(ai);
  reversiClient.run(host, playerColor);
}

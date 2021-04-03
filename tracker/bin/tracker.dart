import 'dart:convert';

import 'package:tracker/tracker.dart' as tracker;
import 'package:http/http.dart' as http;

import 'transaction.dart';

void main(List<String> arguments) async {
  final APIKEY = "CNKRQDX6283WNRHMAPA4EKTCPHJ3CNQ2NK";
  var TARGET = "0xEcA19B1a87442b0c25801B809bf567A6ca87B1da";

  String normalTransac =
      "https://api-ropsten.etherscan.io/api?module=account&action=tokentx&address=${TARGET.toLowerCase()}&startblock=0&endblock=999999999&sort=asc&apikey=${APIKEY}";
  // String normalTransac =
  //     "https://api-ropsten.etherscan.io/api?module=account&action=txlist&address=${TARGET.toLowerCase()}&startblock=0&endblock=99999999&sort=asc&apikey=${APIKEY}";
  print(normalTransac);
  final target = await apiCaller(normalTransac);
  final listTarget = target.result.toList();
  List<String> secondTargets = [];

  // clear duplicate data
  var finalList = listTarget.toSet().toList();

  // show target tranfer
  print("\n\First transac of gobind@BTC.com  ----\n\n\n");
  for (var target in finalList) {
    if (target.tokenSymbol == 'BKTC') {
      print(
          'Tx hash:${target.hash}  from:${target.from} to:${target.to} amount:${double.parse(target.value) / 1000000000000000000}${target.tokenSymbol}\n');
      secondTargets.add(target.to);
    }
  }

  // clear duplicate data
  var finalSecondTargets = secondTargets.toSet().toList();

  int i = 1;

  List<double> secondBalance = [];
  for (var target in finalSecondTargets) {
    print("\n\nSecond round -----${i} Chains ----\n\n\n");
    i++;

    TARGET = target;
    normalTransac =
        "https://api-ropsten.etherscan.io/api?module=account&action=tokentx&address=${TARGET.toLowerCase()}&startblock=0&endblock=999999999&sort=asc&apikey=${APIKEY}";
    // normalTransac =
    //     "https://api-ropsten.etherscan.io/api?module=account&action=txlist&address=${TARGET.toLowerCase()}&startblock=0&endblock=99999999&sort=asc&apikey=${APIKEY}";
    var target2 = await apiCaller(normalTransac);
    for (var t2result in target2.result) {
      if (t2result.tokenSymbol == 'BKTC') {
        print(
            'Tx hash:${t2result.hash}  from:${t2result.from} to:${t2result.to} amount:${double.parse(t2result.value) / (1000000000000000000)}${t2result.tokenSymbol}\n');
        secondBalance.add(double.parse(t2result.value) / (1000000000000000000));
      }
    }
  }
  print(
      "\n\nFinish Second round \n Summary : has total -----${i - 1} Chains ----\n\n\n");
  print(
      "\n\nSUMMARY BALANCE OF SECOND CHAIN ACCOUNT\n-----------------------\n");

  int j = 0;
  for (var target in finalSecondTargets) {
    print("address:" +
        target +
        "has total: " +
        secondBalance[j].toString() +
        ' BKTC' +
        "\n");
    j++;
  }
}

Future<Transactions> apiCaller(String api) async {
  var res = await http.get(Uri.parse(api));
  var transactions = transactionsFromJson(res.body);
  return transactions;
}

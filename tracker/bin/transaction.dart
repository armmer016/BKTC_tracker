// To parse this JSON data, do
//
//     final transactions = transactionsFromJson(jsonString);

import 'dart:convert';

Transactions transactionsFromJson(String str) => Transactions.fromJson(json.decode(str));

String transactionsToJson(Transactions data) => json.encode(data.toJson());

class Transactions {
    Transactions({
        this.status,
        this.message,
        this.result,
    });

    String status;
    String message;
    List<Result> result;

    factory Transactions.fromJson(Map<String, dynamic> json) => Transactions(
        status: json["status"],
        message: json["message"],
        result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        this.blockNumber,
        this.timeStamp,
        this.hash,
        this.nonce,
        this.blockHash,
        this.from,
        this.contractAddress,
        this.to,
        this.value,
        this.tokenName,
        this.tokenSymbol,
        this.tokenDecimal,
        this.transactionIndex,
        this.gas,
        this.gasPrice,
        this.gasUsed,
        this.cumulativeGasUsed,
        this.input,
        this.confirmations,
    });

    String blockNumber;
    String timeStamp;
    String hash;
    String nonce;
    String blockHash;
    String from;
    String contractAddress;
    String to;
    String value;
    String tokenName;
    String tokenSymbol;
    String tokenDecimal;
    String transactionIndex;
    String gas;
    String gasPrice;
    String gasUsed;
    String cumulativeGasUsed;
    String input;
    String confirmations;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        // blockNumber: json["blockNumber"],
        // timeStamp: json["timeStamp"],
        hash: json["hash"],
        // nonce: json["nonce"],
        // blockHash: json["blockHash"],
        from: json["from"],
        // contractAddress: contractAddressValues.map[json["contractAddress"]],
        to: json["to"],
        value: json["value"],
        // tokenName: tokenNameValues.map[json["tokenName"]],
        tokenSymbol: json["tokenSymbol"],
        // tokenDecimal: json["tokenDecimal"],
        // transactionIndex: json["transactionIndex"],
        // gas: json["gas"],
        // gasPrice: json["gasPrice"],
        // gasUsed: json["gasUsed"],
        // cumulativeGasUsed: json["cumulativeGasUsed"],
        // input: inputValues.map[json["input"]],
        // confirmations: json["confirmations"],
    );

    Map<String, dynamic> toJson() => {
        "blockNumber": blockNumber,
        "timeStamp": timeStamp,
        "hash": hash,
        "nonce": nonce,
        "blockHash": blockHash,
        "from": from,
        // "contractAddress": contractAddressValues.reverse[contractAddress],
        "to": to,
        "value": value,
        // "tokenName": tokenNameValues.reverse[tokenName],
        "tokenSymbol": tokenSymbol,
        "tokenDecimal": tokenDecimal,
        "transactionIndex": transactionIndex,
        "gas": gas,
        "gasPrice": gasPrice,
        "gasUsed": gasUsed,
        "cumulativeGasUsed": cumulativeGasUsed,
        // "input": inputValues.reverse[input],
        "confirmations": confirmations,
    };
}


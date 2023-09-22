
import 'package:flutter/material.dart';
import 'package:my_first_app/design/colors.dart';
import 'package:my_first_app/widgets/custom_money_display.dart';

enum TransactionType { positive, negative }

class TransactionDetail {
  final String movementName;
  final String transactionDate;
  final TransactionType transactionType;
  final double amount;
  TransactionDetail(
      {required this.movementName,
      required this.transactionDate,
      required this.transactionType,
      required this.amount});
}

class TransactionDetailByMonth {
  final String month;
  final List<TransactionDetailByDayModel> transactionList;
  TransactionDetailByMonth(
      {required this.month, required this.transactionList});
}

class TransactionDetailByDayModel {
  final String day;
  final int dayNumber;
  final bool isToday;
  final List<TransactionDetail> transactionList;
  TransactionDetailByDayModel(
      {required this.day,
      required this.dayNumber,
      required this.isToday,
      required this.transactionList});
}


class TransactionDetailByDay extends StatelessWidget {
  final String day;
  final int dayNumber;
  final bool isToday;
  final List<TransactionDetail> transactionsList;
  
  const TransactionDetailByDay({super.key, 
      required this.day, 
      required this.dayNumber, 
      required this.isToday, 
      required this.transactionsList});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              Text(day),
              Text(dayNumber.toString(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: isToday ? FontWeight.bold : FontWeight.normal),  
                  ),
              isToday ? const Icon(
                Icons.lens,
                size: 8,
                color: WeinFluColors.brandSuccessColor) :
                const SizedBox(
                  height: 8,
                  width: 8,
                )
            ],
          ),
        ),
        Container(
          width: 340,
          margin: const EdgeInsets.only(left: 16),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: WeinFluColors.brandLightColor,
            borderRadius: BorderRadius.circular(12)
          ),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return transactionsList[index]
                .transactionType == TransactionType.positive ?
                PositiveTransactionDetail(transactionDetail: transactionsList[index]) 
                : NegativeTransactionDetail(transactionDetail: transactionsList[index]);
            }, 
            separatorBuilder: (context, index) {
              return const Divider(
                color: WeinFluColors.brandSecondaryColor,
                thickness: 2,
              );
            }, 
            itemCount: transactionsList.length),
        )
      ],
    );
  }
}



class PositiveTransactionDetail extends StatelessWidget {
  final TransactionDetail transactionDetail;

  const PositiveTransactionDetail(
    {super.key, 
    required this.transactionDetail});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 32,
          height: 32,
          margin: const EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: WeinFluColors.brandSuccessColor
          ),
          child: const Icon(
            Icons.expand_less,
            color: WeinFluColors.brandOnSuccessColor,
          ),
        ),
        SizedBox(
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transactionDetail.movementName,
                style: const TextStyle(
                  color: WeinFluColors.brandDarkColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 13
                )
              ),
              Text(
                transactionDetail.transactionDate,
                style: const TextStyle(
                  color: WeinFluColors.brandLigthDarkColor,
                  fontSize: 10
                )
              )
            ],
          ),
        ),
        Expanded(
          child: CustomMoneyDisplay(
            margin: const EdgeInsets.only(top: 7),
            leftSimbol: const Text(' \$ ', 
                style:  TextStyle(
                  fontWeight: FontWeight.bold,
                  color: WeinFluColors.brandDarkColor,
                  fontSize: 13
                ),),
            amount: transactionDetail.amount, 
            amountStyle: const TextStyle(
              color: WeinFluColors.brandDarkColor,
              fontWeight: FontWeight.bold,
              fontSize: 13
            ), 
            amountStyleSmall: const TextStyle(
              color: WeinFluColors.brandDarkColor,
              fontWeight: FontWeight.bold,
              fontSize: 13
            )
            ),
        )
      ],
    );
  }
}

class NegativeTransactionDetail extends StatelessWidget {
  final TransactionDetail transactionDetail;

  const NegativeTransactionDetail(
    {super.key, 
    required this.transactionDetail});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 32,
          height: 32,
          margin: const EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: WeinFluColors.brandErrorColor
          ),
          child: const Icon(
            Icons.expand_more,
            color: WeinFluColors.brandOnErrorColor,
          ),
        ),
        SizedBox(
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transactionDetail.movementName,
                style: const TextStyle(
                  color: WeinFluColors.brandDarkColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 13
                )
              ),
              Text(
                transactionDetail.transactionDate,
                style: const TextStyle(
                  color: WeinFluColors.brandLigthDarkColor,
                  fontSize: 10
                )
              )
            ],
          ),
        ),
        Expanded(
          child: CustomMoneyDisplay(
            margin: const EdgeInsets.only(top: 7),
            leftSimbol: const Text(' \$ ', 
                style:  TextStyle(
                  fontWeight: FontWeight.bold,
                  color: WeinFluColors.brandOnErrorColor,
                  fontSize: 13
                ),),
            amount: transactionDetail.amount, 
            amountStyle: const TextStyle(
              color: WeinFluColors.brandOnErrorColor,
              fontWeight: FontWeight.bold,
              fontSize: 13
            ), 
            amountStyleSmall: const TextStyle(
              color: WeinFluColors.brandOnErrorColor,
              fontWeight: FontWeight.bold,
              fontSize: 13
            )
            ),
        )
      ],
    );
  }
}
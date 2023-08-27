List<double> dataNew = [];

Future<List<double>> dataLoop(List dataList, double pengali) async{
  await Future.forEach(dataList, (dataList)async{
    dataNew.add(dataList * pengali);
    print('Pengalinya adalah : $pengali');
    await Future.delayed(Duration(seconds: 1));
  });
  return dataNew;
}
void main()async{
  List <double> dataGather = [2, 3, 5, 7, 9];
  dataLoop(dataGather, 2.5);
  
  await Future.delayed(Duration(seconds: 5));
  print('Data sebelumnya adalah : ${dataGather}');
  print('Data terbarunya adalah : ${dataNew}');
}


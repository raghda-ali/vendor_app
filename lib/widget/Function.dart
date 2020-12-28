import 'cinema_seats.dart';

List <String> selected_seats = [];
CienmaSeat s = CienmaSeat();
void addseatnumber (String seatName){
  if(selected_seats.isEmpty){
    selected_seats.add(seatName);
  }else {
    for(int i = 0 ; i<selected_seats.length ; i++){
      if(selected_seats[i] == seatName) {
        print('selected seats = $selected_seats');
        print('length = ${selected_seats.length}');
        break;
      } else{
        selected_seats.add(seatName);
        print('selected seats = $selected_seats');
        print('length = ${selected_seats.length}');
        break;
      }
    }
  }



}

String get selectedSeatsAsString => selected_seats.join(', ');
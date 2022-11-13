class SummaryModel {
  int currentCount;
  int maxCount;
  int emptyRoom;
  String lastUpdated;

  SummaryModel(
      {this.currentCount = 0,
      this.maxCount = 0,
      this.emptyRoom = 0,
      this.lastUpdated = ""});

  factory SummaryModel.fromJson(dynamic json) {
    return SummaryModel(
      currentCount: json['Current Count'],
      maxCount: json['Max Count'],
      emptyRoom: json['Empty Rooms'],
      lastUpdated: "${json['Last Updated']}"
    );
  }

  Map toJson() => {
        "Current Count": currentCount,
        "Max Count": maxCount,
        "Empty Rooms": emptyRoom,
        "Last Updated": lastUpdated
      };
}

class EmptyModel {
  int roomNo;
  int totalOccupants;
  int currentOccupants;

  EmptyModel(
      {this.roomNo = 0,
      this.totalOccupants = 0,
      this.currentOccupants = 0
      });

  factory EmptyModel.fromJson(dynamic json) {
    return EmptyModel(
      roomNo: json['Room No'],
      totalOccupants: json['Total Occupants'],
      currentOccupants: json['Current Occupants']
    );
  }

  Map toJson() => {
        "Room No": roomNo,
        "Total Occupants": totalOccupants,
        "Current Occupants": currentOccupants
      };
}

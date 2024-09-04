enum StatusFilters {
  all('All Agreements'),
  onlyForMe('Only for me'),
  sendOther('Send by others'),
  waitingOther('Waiting for others'),
  completed('Completed'),
  receiveCopy('Receive a copy'),
  draft('Draft'),
  cancelled('Cancelled'),
  downloads('Downloads');

  final String label;

  const StatusFilters(this.label);
}

enum DateFilters {
  all('All Agreements'),
  last12Mon('Last 12 Months'),
  last6Mon('Last 06 Months'),
  last30Day('Last 30 Days'),
  lastWeek('Last Week'),
  last24H('Last 24 Hours');

  final String label;

  const DateFilters(this.label);
}

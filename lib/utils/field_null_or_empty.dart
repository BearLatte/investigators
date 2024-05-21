bool isNullOrEmpty(dynamic obj) {
  if(obj == Null) {
    return true;
  }

  if(obj is String) {
    return obj.isEmpty || obj == 'null';
  }

  if(obj is num) {
    return false;
  }

  if(obj is int) {
    return false;
  }

  if(obj is DateTime) {
    return false;
  }

  if(obj is Map) {
    return obj.isEmpty;
  }

  if(obj is List) {
    return obj.isEmpty;
  }

  return false;
}
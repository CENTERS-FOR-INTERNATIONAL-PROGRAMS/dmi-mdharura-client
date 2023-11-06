List<String> subTypes(String type) {
  switch (type) {
    case 'Country':
      return ['County'];
    case 'County':
      return ['Subcounty'];
    case 'Subcounty':
      List<String> subTypes = [];
      subTypes.add('Community unit');
      subTypes.add('Health facility');
      subTypes.add('Veterinary facility');
      subTypes.add('Learning institution');
      return subTypes;
    default:
      return [];
  }
}

List<String> spots(String? type) {
  switch (type) {
    case 'Country':
      return ['VIEWER', 'CEBS', 'HEBS', 'VEBS', 'LEBS', 'PEBS/MEBS'];
    case 'County':
      return ['VIEWER', 'CEBS', 'HEBS', 'VEBS', 'LEBS', 'PEBS/MEBS'];
    case 'Subcounty':
      return ['VIEWER', 'CEBS', 'HEBS', 'VEBS', 'LEBS', 'PEBS/MEBS'];
    case 'Health facility':
      return ['VIEWER', 'HCW', 'SFP'];
    case 'Learning institution':
      return ['VIEWER', 'LEBS'];
    case 'Veterinary facility':
      return ['VIEWER', 'VET'];
    case 'Community unit':
      return ['VIEWER', 'CHA', 'AHA', 'CHV', 'CDR'];
    default:
      return [];
  }
}

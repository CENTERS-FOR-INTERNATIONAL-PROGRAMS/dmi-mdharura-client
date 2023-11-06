import 'package:m_dharura/model/signal.dart';

final List<Signal> cebsSignals = [
  Signal(
    code: '1',
    description:
        'Two or more people presenting with similar symptoms in a community within a week',
  ),
  Signal(
    code: '2',
    description: 'Any death in the community',
  ),
  Signal(
    code: '3',
    description:
        'Any child under 15 years with sudden weakness of the legs or arms',
  ),
  Signal(
    code: '4',
    description:
        'Increase in number of people older than 5 years with lots of watery diarrhea',
  ),
  Signal(
    code: '5',
    description:
        'Increased sickness including abortions and/or deaths of animals (wild or domestic and poultry/ birds or fish)',
  ),
  Signal(
    code: '6',
    description: 'Any event that causes public health anxiety/concern',
  ),
  Signal(
    code: '7',
    description: 'Any person presenting with hotness of the body AND either vomiting, diarrhea, headache, body rash, red eyes, or unusual bleeding AND recently (within three weeks) traveled or had contact with a person from Uganda or DRC',
  ),
];

final List<Signal> hebsSignals = [
  Signal(
    code: 'h1',
    description:
        'Two or more cases with similar symptoms and signs from the same community, social grouping, or function that required hospitalization within a week',
  ),
  Signal(
    code: 'h2',
    description:
        'Any healthcare worker who develops signs and symptoms during/after caring for a patient with similar illness',
  ),
  Signal(
    code: 'h3',
    description:
        'An increase in the number of patients (outpatients and inpatients); laboratory requests; prescriptions; etc. at the health facility',
  ),
];
final List<Signal> vebsSignals = [
  Signal(
    code: 'v1',
    description:
        'A cluster of animals with similar clinical signs from the same herd (farm, ranch, watering/feeding area, market, village/estate, etc.) that require treatment within a week',
  ),
  Signal(
    code: 'v2',
    description:
        'Any animal health care worker/ handler who develops an illness suspected to have been contracted from a sick animal',
  ),
];

final List<Signal> lebsSignals = [
  Signal(
    code: 'l1',
    description:
        'A learner or staff member presenting with symptoms of respiratory illness (difficulty in breathing, runny nose, cough, sore throat or fever [≥38.0°C]), or general body weakness)',
  ),
  Signal(
    code: 'l2',
    description:
        'Absenteeism of a learner or staff member due to respiratory illness (difficulty in breathing, runny nose, cough, sore throat or fever [≥38.0°C]), or general body weakness)',
  ),
  Signal(
    code: 'l3',
    description:
        'Death of a learner or staff member who presented with symptoms of respiratory illness (difficulty in breathing, runny nose, cough, sore throat or fever [≥38.0°C]), or general body weakness) or due to unknown cause',
  ),
  Signal(
    code: 'p1',
    description:
        'Learner or staff members who develops respiratory illness (difficulty in breathing, cough, hotness of body, or general body weakness) at home',
  ),
  Signal(
    code: 'p2',
    description:
        'Household where a member has been confirmed positive for COVID-19 as per MOH guidelines',
  ),
  Signal(
    code: 'p3',
    description:
        'Death of a household member who presented with symptoms of respiratory illness (difficulty in breathing, cough, hotness of body, or general body weakness) or due to unknown cause',
  ),
  Signal(
    code: 'm1',
    description:
        'A cluster (≥3) of learners and/or staff members from the same learning institution seeking care for respiratory illness (cough, fever [≥38.0°C]) or general body weakness) within a day',
  ),
  Signal(
    code: 'm2',
    description:
        'A learner or staff member presenting with unexplained difficulty in breathing',
  ),
  Signal(
    code: 'm3',
    description:
        'Death of a learner, staff member or guardian/parent who presented with acute respiratory illness (difficulty in breathing, cough, fever [≥38.0°C]) or general body weakness) or due to unknown cause',
  ),
];

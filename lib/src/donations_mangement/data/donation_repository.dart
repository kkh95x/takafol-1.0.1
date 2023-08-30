import 'package:takafol/src/donations_mangement/domain/donation.dart';

abstract class DonationRepository {
  Future<void> createDonation(Donation donation);
  Future<List<Donation>?> getCreatedDonations(String benefactorId);
    Future<List<Donation>?> getWaitingDonations(String benefactorId);
        Future<List<Donation>?> getCompelteDonations(String benefactorId);
Future<List<Donation>>getAllDonationByBenefactorId(String userId);

    Future<bool> isHaveCreatedDonations(String benefactorId);
      Future<void> updateDonation(Donation donation);
          Future<Donation?> getDonationById(String id);
                    Stream<List<Donation>?> getDonationsStream(String idBenefactor);



}

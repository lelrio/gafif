import Foundation
import Firebase

class FireDB {
    let store = Firestore.firestore()
    var users : CollectionReference {
        return store.collection("users")
    }
    func addUser(_ uid: String, data: [String: Any]) {
        users.document(uid).setData(data)
    }
    func addCredentials(data: [String: Any], completion: @escaping (_ error: String?) -> Void) {
        guard let uid = FireAuth().currentId else {
            completion("Erreur, vous n'etes pas connecté !")
            return
        }
        users.document(uid).collection("credentialsCollection").document().setData(data) { (error) in
            if let error = error {
                completion(error.localizedDescription)
                return
            }
            completion(nil)
        }
    }
    func getCredentialsCollection(completion: @escaping ([Credentials]?, String?) -> Void){
    //Récupération uid
        guard let uid = FireAuth().currentId else {
            completion(nil, "Erreur, vous n'etes pas connecté !")
            return
        }
        users.document(uid).collection("credentialsCollection").addSnapshotListener { (snapshot, error) in
            if let error = error {
                completion(nil, error.localizedDescription)
                return
            }
            guard let snapshot = snapshot else{
                completion(nil, "error indetermine")
                return
            }
            var credentialsCollection:[Credentials] = []
            let documents = snapshot.documents
            for document in documents{
               // credentialsCollection.append(Credentials((document: document)))
                
            }
            completion(credentialsCollection, nil)
        }
    }
}

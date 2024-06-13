/*const functions = ('firebase-functions');
const admin = ('firebase-admin');
admin.initializeApp();

exports.sendNotification = functions.firestore
  .document('notifications/{notificationId}')
  .onCreate(async (snapshot, context) => {
    try {
      const notification = snapshot.data();
      const userId = notification.userId;

      // Retrieve the FCM token for the user
      const notificationSnapshot = await admin.firestore().collection('Notifications').doc(userId).get();
      const fcmToken = notificationSnapshot.data().fcmToken;

      // Send a notification to the user
      const payload = {
        notification: {
          title: 'New Notification',
          body: notification.message,
        },
      };

      await admin.messaging().sendToDevice(fcmToken, payload);
      
      return null; // Important: Cloud Functions must return a value or a Promise
    } catch (error) {
      console.error('Error sending notification:', error);
      throw new functions.https.HttpsError('internal', 'Error sending notification', error.message);
    }
  });
*/
const admin = require('firebase-admin');
const functions = require('firebase-functions');

admin.initializeApp();

const db = admin.firestore();

exports.onUserCreated = functions.firestore
    .document('users/{userId}')
    .onCreate((change, context) => {
        const FieldValue = admin.firestore.FieldValue;
        var ref = db.collection('stats').doc('statsDocument');
        ref.update({ userCount: FieldValue.increment(1) });
    });

exports.onLogbookCreated = functions.firestore
    .document('users/{userId}/logbook/{logbookId}')
    .onCreate((change, context) => {
        const FieldValue = admin.firestore.FieldValue;
        var ref = db.collection('stats').doc('statsDocument');
        ref.update({ logbookCount: FieldValue.increment(1) });
    });

exports.onProjectCreated = functions.firestore
    .document('users/{userId}/projects/{projectId}')
    .onCreate((change, context) => {
        const FieldValue = admin.firestore.FieldValue;
        var ref = db.collection('stats').doc('statsDocument');
        ref.update({ projectCount: FieldValue.increment(1) });
    });

exports.onGoalCreated = functions.firestore
    .document('users/{userId}/goals/{goalId}')
    .onCreate((change, context) => {
        const FieldValue = admin.firestore.FieldValue;
        var ref = db.collection('stats').doc('statsDocument');
        ref.update({ goalCount: FieldValue.increment(1) });
    });

exports.onHangboardEntryCreated = functions.firestore
    .document('users/{userId}/hangboardEntries/{id}')
    .onCreate((change, context) => {
        const FieldValue = admin.firestore.FieldValue;
        var ref = db.collection('stats').doc('statsDocument');
        ref.update({ hangboardEntryCount: FieldValue.increment(1) });
    });

exports.onHangboardRoutineCreated = functions.firestore
    .document('users/{userId}/hangboardRoutines/{id}')
    .onCreate((change, context) => {
        const FieldValue = admin.firestore.FieldValue;
        var ref = db.collection('stats').doc('statsDocument');
        ref.update({ hangboardRoutineCount: FieldValue.increment(1) });
    });

exports.onTrainingNotesModified = functions.firestore
    .document('users/{userId}/trainingNotes/{id}')
    .onWrite((change, context) => {
        const FieldValue = admin.firestore.FieldValue;
        var ref = db.collection('stats').doc('statsDocument');
        ref.update({ trainingNotesCount: FieldValue.increment(1) });
    });
package com.github.beatrizgomees.contact.project.config;

import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;
import com.mongodb.client.MongoCollection;
import org.bson.Document;

public class MongoConfig {
    MongoDatabase database;
    MongoCollection<Document> collection = database.getCollection("movies");
}

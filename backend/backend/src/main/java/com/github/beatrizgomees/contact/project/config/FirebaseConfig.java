package com.github.beatrizgomees.contact.project.config;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.auth.FirebaseAuth;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

@Configuration
public class FirebaseConfig {
    @Value("classpath:serviceAccountKey.json")
    private Resource privateKey;

    @Bean
    public void firebaseApp() throws IOException {
        try {
            FileInputStream serviceAccount = new FileInputStream(privateKey.getFile());
            FirebaseOptions options = new FirebaseOptions.Builder()
                    .setCredentials(GoogleCredentials.fromStream(serviceAccount))
                    .build();


            FirebaseApp.initializeApp(options);
            FirebaseApp.initializeApp(options);
        } catch (
                Exception error) {
            error.printStackTrace();
        }
    }



//    @Bean
//    public FirebaseAuth firebaseAuth(FirebaseApp firebaseApp) {
//        return FirebaseAuth.getInstance(firebaseApp);
//    }

}
package com.horizon;

import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.api.java.JavaSparkContext;

import java.util.Arrays;

public class App {

    public static void main(String[] args) throws InterruptedException {
        SparkConf sparkConf = new SparkConf()
                .setAppName("Example Spark App");
        JavaSparkContext sparkContext = new JavaSparkContext(sparkConf);
        Thread.sleep(5000);
        JavaRDD<Integer> stringJavaRDD = sparkContext.parallelize(Arrays.asList(2, 3, 4, 3, 2, 5, 6, 7, 8, 6, 5, 4, 3, 2, 1, 3, 4, 3));
        System.out.println("Number of lines in file = " + stringJavaRDD.count());
        Thread.sleep(5000);
    }
}

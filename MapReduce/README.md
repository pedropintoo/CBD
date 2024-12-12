To use your `WordCount` implementation in Maven, follow these steps:

---

### 1. **Set Up Your Maven Project**

Place the `WordCount` Java code in the `src/main/java/com/example` directory of your project.

---

### 3. **Compile and Package the JAR**
Use Maven to compile the code and package it into an executable JAR:

```bash
mvn clean package
```

This will produce a JAR file in the `target` directory, typically named `demo-1.0-SNAPSHOT.jar`.

---

### 4. **Run the JAR on Hadoop**
Copy the compiled JAR to your Hadoop environment and execute it.

1. **Start Hadoop Services** (if not already running):
```bash
docker-compose up -d
```

2. **Prepare Input Data**:
Upload the input data file to HDFS:
```bash
docker exec -it namenode bash
hdfs dfs -mkdir -p /user/root/input
echo -e "Hadoop é incrível\nDocker é útil\nHadoop e Docker juntos" > input.txt
hdfs dfs -put input.txt /user/root/input
```

3. **Run the MapReduce Job**:
Execute your JAR file:
```bash
hadoop jar target/demo-1.0-SNAPSHOT.jar com.example.WordCount /user/root/input /user/root/output
```

4. **View the Results**:
```bash
hdfs dfs -cat /user/root/output/part-r-00000
```

---

## New Example Inverted Index


### **Steps to Run**

1. **Compile and Package**:
Compile and package the `InvertedIndex` class into a JAR using Maven.

```bash
mvn clean package
```

2. **Prepare Input Files**:
Create input files (`file1.txt`, `file2.txt`, etc.) and upload them to HDFS.

```bash
hdfs dfs -mkdir -p /user/root/input
hdfs dfs -put file1.txt file2.txt /user/root/input
```

3. **Run the MapReduce Job**:
Execute the MapReduce job with the input and output paths.

```bash
hadoop jar target2/demo2-1.0-SNAPSHOT.jar com.example.InvertedIndex /user/root/input /user/root/output
```

4. **View the Results**:
   Retrieve the results from HDFS.

   ```bash
   hdfs dfs -cat /user/root/output/part-r-00000
   ```

---

<?php

session_start();

// Cek apakah pengguna sudah login
if (!isset($_SESSION['user_id'])) {
    // Jika tidak, arahkan pengguna ke halaman login
    header("Location: login.php");
    exit;
}

$dsn = "mysql:host=localhost;dbname=uas_pbl;charset=utf8mb4";
$username = "root";
$password = "";

try {
    $pdo = new PDO($dsn, $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Database connection failed: " . $e->getMessage());
}

// Handle form submission for creating/updating articles
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $title = $_POST['title'];
    $content = $_POST['content'];
    $category_id = $_POST['category_id'];
    $photo_path = $_FILES['image']['name'] ?? null;

    // Upload the photo
    if ($photo_path) {
        move_uploaded_file($_FILES['image']['tmp_name'], "uploads/$photo_path");
    }

    if (isset($_POST['action']) && $_POST['action'] === 'create') {
        // Create article
        $stmt = $pdo->prepare("INSERT INTO articles (title, content, photo_path, category_id) VALUES (?, ?, ?, ?)");
        $stmt->execute([$title, $content, $photo_path, $category_id]);
    } elseif (isset($_POST['action']) && $_POST['action'] === 'update') {
        $id = $_POST['id']; // Get the ID for updating
        // Update article
        $stmt = $pdo->prepare("UPDATE articles SET title = ?, content = ?, photo_path = ?, category_id = ? WHERE id = ?");
        $stmt->execute([$title, $content, $photo_path, $category_id, $id]);
    } elseif (isset($_POST['action']) && $_POST['action'] === 'delete') {
        $id = $_POST['id']; // Get the ID for deleting
        // Delete article
        $stmt = $pdo->prepare("DELETE FROM articles WHERE id = ?");
        $stmt->execute([$id]);
    }
}

// Fetch categories to display in dropdown
$stmt = $pdo->query("SELECT * FROM categories");
$categories = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Fetch articles to display
$stmt = $pdo->query("SELECT * FROM articles");
$articles = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Article Management</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h2>Article Management</h2>

    <!-- Back Button -->
    <a href="form_admin.html" class="btn btn-secondary mb-3">Back</a>

    <!-- Create Article Form -->
    <h3>Create Article</h3>
    <form method="POST" enctype="multipart/form-data">
        <div class="mb-3">
            <label for="title" class="form-label">Title</label>
            <input type="text" class="form-control" id="title" name="title" required>
        </div>
        <div class="mb-3">
            <label for="content" class="form-label">Content</label>
            <textarea class="form-control" id="content" name="content" rows="5" required></textarea>
        </div>
        <div class="mb-3">
            <label for="category_id" class="form-label">Category</label>
            <select class="form-select" id="category_id" name="category_id" required>
                <option value="" disabled selected>Select a category</option>
                <?php foreach ($categories as $category): ?>
                    <option value="<?= $category['id'] ?>"><?= $category['name'] ?></option>
                <?php endforeach; ?>
            </select>
        </div>
        <div class="mb-3">
            <label for="image" class="form-label">Article Thumbnail</label>
            <input type="file" class="form-control" id="image" name="image">
        </div>
        <button type="submit" class="btn btn-success" name="action" value="create">Create Article</button>
    </form>

    <hr>

    <!-- View Articles Section -->
    <h3>View Articles</h3>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Content</th>
            <th>Category</th>
            <th>Photo</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <?php foreach ($articles as $article): ?>
            <tr>
                <td><?= $article['id'] ?></td>
                <td><?= $article['title'] ?></td>
                <td><?= $article['content'] ?></td>
                <td>
                    <?php
                    // Fetch category name for the article
                    $stmt = $pdo->prepare("SELECT name FROM categories WHERE id = ?");
                    $stmt->execute([$article['category_id']]);
                    $category = $stmt->fetch();
                    echo $category ? $category['name'] : 'N/A';
                    ?>
                </td>
                <td><img src="uploads/<?= $article['photo_path'] ?>" alt="Photo" style="width: 100px;"></td>
                <td>
                    <!-- Update Button -->
                    <button class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#updateModal<?= $article['id'] ?>">Edit</button>
                    <!-- Delete Button -->
                    <form method="POST" class="d-inline">
                        <input type="hidden" name="id" value="<?= $article['id'] ?>">
                        <button type="submit" class="btn btn-danger btn-sm" name="action" value="delete">Delete</button>
                    </form>
                </td>
            </tr>

            <!-- Update Article Modal -->
            <div class="modal fade" id="updateModal<?= $article['id'] ?>" tabindex="-1" aria-labelledby="updateModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="updateModalLabel">Update Article</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form method="POST" enctype="multipart/form-data">
                                <input type="hidden" name="id" value="<?= $article['id'] ?>">
                                <div class="mb-3">
                                    <label for="title" class="form-label">Title</label>
                                    <input type="text" class="form-control" name="title" value="<?= $article['title'] ?>" required>
                                </div>
                                <div class="mb-3">
                                    <label for="content" class="form-label">Content</label>
                                    <textarea class="form-control" name="content" rows="5" required><?= $article['content'] ?></textarea>
                                </div>
                                <div class="mb-3">
                                    <label for="category_id" class="form-label">Category</label>
                                    <select class="form-select" name="category_id" required>
                                        <option value="" disabled>Select a category</option>
                                        <?php foreach ($categories as $category): ?>
                                            <option value="<?= $category['id'] ?>" <?= $category['id'] == $article['category_id'] ? 'selected' : '' ?>><?= $category['name'] ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="image" class="form-label">Article Thumbnail</label>
                                    <input type="file" class="form-control" name="image">
                                </div>
                                <button type="submit" class="btn btn-primary" name="action" value="update">Update Article</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        <?php endforeach; ?>
        </tbody>
    </table>
</div>

<!-- Optional JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>

const express = require("express");
const router = express.Router();
const { protect } = require("../middleware/auth");

const {
  getCourses,
  getCourse,
  createCourse,
  updateCourse,
  deleteCourse,
} = require("../controllers/course");

router.get("/getAllCourse", getCourses);
router.get("/:id", getCourse);

router.post("/createCourse", createCourse);
router.put("/:id", protect, updateCourse);
router.delete("/:id", protect, deleteCourse);

module.exports = router;

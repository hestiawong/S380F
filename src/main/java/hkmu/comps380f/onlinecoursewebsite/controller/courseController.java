package hkmu.comps380f.onlinecoursewebsite.controller;

import hkmu.comps380f.onlinecoursewebsite.dao.CourseRepository;
import hkmu.comps380f.onlinecoursewebsite.dao.LectureRepository;
import hkmu.comps380f.onlinecoursewebsite.exception.AttachmentNotFound;
import hkmu.comps380f.onlinecoursewebsite.exception.LectureNotFound;
import hkmu.comps380f.onlinecoursewebsite.model.Attachment;
import hkmu.comps380f.onlinecoursewebsite.model.Comment;
import hkmu.comps380f.onlinecoursewebsite.model.Course;
import hkmu.comps380f.onlinecoursewebsite.model.Lecture;
import hkmu.comps380f.onlinecoursewebsite.service.AttachmentService;
import hkmu.comps380f.onlinecoursewebsite.service.LectureService;
import hkmu.comps380f.onlinecoursewebsite.view.DownloadingView;
import java.io.IOException;
import java.security.Principal;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

@Controller
@RequestMapping("/course")
public class courseController {

    @Autowired
    private LectureService lectureService;

    @Autowired
    private AttachmentService attachmentService;

    @Resource
    CourseRepository courseRepo;

    @Resource
    LectureRepository lectureRepo;

    @GetMapping({"", "/list"})
    public String list(ModelMap model) {
        model.addAttribute("course", courseRepo.findAll());
        return "list";
    }

    @GetMapping("/visitor")
    public String visitorlist(ModelMap model) {
        model.addAttribute("course", courseRepo.findAll());
        return "visitorlist";
    }

    @GetMapping("/deletecourse/{coursename}")
    public View deleteCourse(@PathVariable("coursename") String coursename) {
        courseRepo.delete(courseRepo.findById(coursename).orElse(null));
        return new RedirectView("/course", true);
    }

    @GetMapping("/deletelecture/{id}")
    public View deleteLecture(@PathVariable("id") Long id) {
        Lecture lecture = lectureRepo.findById(id).orElse(null);
        lectureRepo.delete(lecture);
        return new RedirectView("/course", true);
    }

    @GetMapping("/createcourse")
    public ModelAndView createCourse() {
        return new ModelAndView("createCourse", "course", new Form());
    }

    @PostMapping("/createcourse")
    public String createCourse(Form form) throws IOException {
        Course course = courseRepo.findById(form.getCoursename()).orElse(null);
        if (course == null) {
            Course newcourse = new Course(form.getCoursename());
            courseRepo.save(newcourse);
            long lectureId = lectureService.createLecture(newcourse, form.getLecturetitle(), form.getAttachments());
            return "redirect:/course/" + lectureId;
        } else {
            long lectureId = lectureService.createLecture(course, form.getLecturetitle(), form.getAttachments());
            return "redirect:/course/" + lectureId;
        }

    }

    @GetMapping("/{id}")
    public ModelAndView getLecturePage(ModelMap model, @PathVariable("id") Long id) {
        Lecture lecture = lectureRepo.findById(id).orElse(null);
        ModelAndView modelAndView = new ModelAndView("lecturePage");
        modelAndView.addObject("lecture", lecture);

        Form form = new Form();
        modelAndView.addObject("AttachmentForm", form);
        return modelAndView;
    }

    @PostMapping("/{id}")
    public String edit(@PathVariable("id") long id, Form form)
            throws IOException, LectureNotFound {
        lectureService.updateLecture(id, form.getAttachments());
        return "redirect:/course/" + id;
    }


    @PostMapping("/comment/{id}")
    public String comment(@PathVariable("id") long id, Form form, Principal principal)
            throws IOException, LectureNotFound {
        lectureService.addComment(id, form.getComment(), principal.getName());
        return "redirect:/course/" + id;
    }

    @GetMapping("/{id}/attachment/{attachment:.+}")
    public View download(@PathVariable("id") long id,
            @PathVariable("attachment") String name) {

        Attachment attachment = attachmentService.getAttachment(id, name);
        if (attachment != null) {
            return new DownloadingView(attachment.getName(),
                    attachment.getMimeContentType(), attachment.getContents());
        }
        return new RedirectView("/{id}", true);
    }

    @GetMapping("/{id}/delete/attachment/{attachment:.+}")
    public String deleteAttachment(@PathVariable("id") long id,
            @PathVariable("attachment") String name) throws AttachmentNotFound {
        lectureService.deleteAttachment(id, name);
        return "redirect:/course/" + id;
    }

    @GetMapping("/{id}/delete/comment/{commentId}")
    public String deleteComment(@PathVariable("id") long id,
            @PathVariable("commentId") long commentId) {
        lectureService.deleteComment(id, commentId);
        return "redirect:/course/" + id;
    }

    public static class Form {

        private String coursename;
        private String lecturetitle;
        private List<MultipartFile> attachments;
        private String comment;

        public String getComment() {
            return comment;
        }

        public void setComment(String comment) {
            this.comment = comment;
        }

        public String getCoursename() {
            return coursename;
        }

        public void setCoursename(String coursename) {
            this.coursename = coursename;
        }

        public String getLecturetitle() {
            return lecturetitle;
        }

        public void setLecturetitle(String lecturetitle) {
            this.lecturetitle = lecturetitle;
        }

        public List<MultipartFile> getAttachments() {
            return attachments;
        }

        public void setAttachments(List<MultipartFile> attachments) {
            this.attachments = attachments;
        }

    }
}

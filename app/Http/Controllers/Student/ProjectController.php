<?php

namespace App\Http\Controllers\Student;

use App\Project;
use App\School;
use App\Member;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class ProjectController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $projects = Auth::User()->projects()->latest()->get();
        return view('student.project.index', compact('projects'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $schools = School::all();
        $members = Member::all();
        return view('student.project.create', compact('schools', 'members' ));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'title' => 'required',
        ]);
            $slug = str_slug($request->title);
            $project = new Project();
            $project->user_id = Auth::id();
            $project->title = $request->title;
            $project->slug = $slug;
            $project->start_date = $request->start_date;
            $project->end_date = $request->end_date;
            if(isset($request->status))
            {
                $project->status = true;
            }else{
                $project->status = false;
            }

            $project->is_approved = false;

            $project->save();

            $project->schools()->attach($request->schools);
            $project->members()->attach($request->members);  

            Toastr::success('Project Saved Successfully', 'Success');
            return redirect()->route('student.project.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Project  $project
     * @return \Illuminate\Http\Response
     */
    public function show(Project $project)
    {
        return view('student.project.show',compact('project'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Project  $project
     * @return \Illuminate\Http\Response
     */
    public function edit(Project $project)
    {
        $schools = School::all();
        $members = Member::all();
        return view('student.project.edit', compact('project','schools', 'members' ));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Project  $project
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Project $project)
    {
        $this->validate($request, [
            'title' => 'required',
        ]);
            $slug = str_slug($request->title);
            $project->user_id = Auth::id();
            $project->title = $request->title;
            $project->slug = $slug;
            $project->start_date = $request->start_date;
            $project->end_date = $request->end_date;
            if(isset($request->status))
            {
                $project->status = true;
            }else{
                $project->status = false;
            }

            $project->is_approved = false;

            $project->save();

            $project->schools()->sync($request->schools);
            $project->members()->sync($request->members);  

            Toastr::success('Project Updated Successfully', 'Success');
            return redirect()->route('student.project.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Project  $project
     * @return \Illuminate\Http\Response
     */
    public function destroy(Project $project)
    {
        $project->schools()->detach();
        $project->members()->detach();
        $project->delete();
        Toastr::success('Project Successfully Deleted', 'Success');
        return redirect()->back();
    }
}
